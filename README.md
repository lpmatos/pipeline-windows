<p align="center">
  <img alt="pipeline-windows" src="https://miro.medium.com/max/264/1*0lzbnKgE5ILm4gctPH-EJg.jpeg" width="250px" float="center"/>
</p>

<h1 align="center">Pipeline Windows</h1>

<p align="center">
  <strong>GitLab CI pipeline - support Windows Docker Build</strong>
</p>

<p align="center">
  <a href="https://github.com/lpmatos/pipeline-windows">
    <img alt="Open Source" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows/graphs/contributors">
    <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows">
    <img alt="GitHub Language Count" src="https://img.shields.io/github/languages/count/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows">
    <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows/stargazers">
    <img alt="GitHub Stars" src="https://img.shields.io/github/stars/lpmatos/pipeline-windows?style=social">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows/commits/master">
    <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows">
    <img alt="Repository Size" src="https://img.shields.io/github/repo-size/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows/issues">
    <img alt="Repository Issues" src="https://img.shields.io/github/issues/lpmatos/pipeline-windows">
  </a>

  <a href="https://github.com/lpmatos/pipeline-windows/blob/master/LICENSE">
    <img alt="MIT License" src="https://img.shields.io/github/license/lpmatos/pipeline-windows">
  </a>
</p>

### Menu

<p align="left">
  <a href="#pre-requisites">Pre-Requisites</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#description">Description</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#testing">Testing</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-to-contribute">How to contribute</a>
</p>

### By me a coffe

Pull requests are welcome. If you'd like to support the work and buy me a ☕, I greatly appreciate it!

<a href="https://www.buymeacoffee.com/EatdMck" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Getting Started

To use this repository you need a **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/pipeline-windows.git -b master
```

This will give access of the project on your local machine.

### Pre Requisites

To this project you yeed:

* Ruby 2.6.5.
* GitLab Runner.
* GitLab Server.

### Built with

- Dev Tools
  - [Ruby](https://www.ruby-lang.org/pt/)
  - [GitLab CI](https://docs.gitlab.com/ee/ci/)

### GitLab Runner Tags

- windows
- aws-prod

### About

When we are working with continuous delivery methodologies, we have two extremely important concepts that need to be understood and differentiated: internships and jobs.

Basically, the stages of a pipeline will be the organizers of the job execution flow. In GitLab the stages are described in a file called .gitlab-ci.yml, along with the jobs. This file is interpreted by an external plugin called GitLab Runner that is responsible for raising what is necessary from the "hardware" point of view to run the jobs. Finally, we have the jobs, which represent the execution of our tasks within our wake.

<p align="center">
  <img alt="gitlab-ci" src="https://docs.gitlab.com/ee/ci/introduction/img/gitlab_workflow_example_extended_v12_3.png" width="950px" float="center"/>
</p>

### Description

Nessa pipeline fazemos algumas validações iniciais com o estágio **.pre** onde validamos algumas variáveis que utilizamos como input para fazer alguns processos, como:

* Deploy
* Push
* Autenticação

Geralmente são variáveis sensíveis e que devemos passar de alguma forma para a nossa pipeline. A forma mais abordada é utilizando a própria interface do GitLab e setando esses valores como environments ou de um grupo ou do próprio projeto. Caso o estágio de **.pre** ache algum valor que esteja faltando ou que esteja vazio, o resto da pipeline não é concluída. 

Após as validações temos um estádio de Lint/Reports, na qual executamos ferramentas de análise estática para validar códigos, arquivos e outros... Nesse caso utilizado para validar o Dockerfile. Rodamos uma ferramenta chamada [hadolint](https://github.com/hadolint/hadolint) que faz o Lint do Dockerfile. Quando rodamos ela passamos um arquivo Dockerfile como parâmetro e ela analisa procurando coisas fora do padrão e recomendando boas práticas. Caso a ferramente encontre algum problema, a pipeline não falhará, o job irá finalizar em estado de warning e o resto do processo será continuado. A níveis de melhoria é recomendado que todos os warnings sejam selecionados, assim iremos conseguir garantir uma melhor entrega/qualidade do nosso processo.

Com o final do Lint/Reports temos o estágio de build. No build iremos criar jobs responsáveis por construções. Nesse caso abordamos a construção de images Docker. O tipo de imagem base que você utilizada para criar seu Container irá impactar diretamente no tipo de runner que você deverá utilizar para executar esse Docker Build. Como nesse projeto estamos construindo uma pipeline que suporta build de imagens Windows, precisamos de um Runner Windows. Jobs mais simples e que não precisam dessa especificação podem rodar em runner K8S, Docker+Machine ou o que você preferir.

Com a imagem buildada precisamos armazenar ela em algum lugar. Esse lugar geralmente é um registry. Existem vários registrys por ai e você pode escolher em qual você irá armazenar suas imagens. Na nossa perspectiva criamos push's para o registry interno do GitLab Server e o registry da AWS ECR. Para fazer o Docker Push antes você irá se autenticar no registry e caso seja bem sucedido a autenticação você está preparado para enviar sua imagem.

Esqueci de avisar, mas caso o stage de Build ou Push falhar, a pipeline também falhará e os jobs a sua frente não serão executados. Essa abordagem é uma abordagem default do GitLab, mas pode ser contornada caso seja necessário. Por padrão iremos manter o default.

Tendo a imagem já no registry que escolhemos, podemos executar outras tarefas. Uma delas será o Deploy. O tipo de deploy irá diferenciar de acordo com a forma que sua arquitetura de aplicação foi criada. Nesse caso temos uma arquitetura na AWS que utilizar ECS para criar os nossos services de containers e rodar nossas aplicações. Portanto, o tipo de deploy feito aqui é deploy de ECS. Mas também utilizamos bastante o deploy de ambiente K8S, porém não foi abordado na construção dessa pipeline Windows.

Pronto, após essas definições você poderá compreender melhor como nós podemos criar de forma simples uma pipeline que suporta Build de Windows. Vale ressaltar que caso você queira seguir esse mesmo passo a passo você irá antes precisar de uma infraestrutura que comporte todas as especificações utilizadas para essa pipeline, como:

* GitLab Server
* GitLab Runner:
  * Shell - Windows
  * K8S
* AWS:
  * ECS
  * ECR

### Pipeline 

#### Templates

- .gitlab-ci.yml
- base.yml
- bronze.yml

#### Stages

- Pre Check
- Clean
- Lint
- Build
- Push
- Deploy

#### Workflow

```yml
workflow:
  rules:
    - if: $PIPELINE_DISABLE == "true"
      when: never
    - if: '$CI_PIPELINE_SOURCE =~ /^(trigger|merge_request_event)$/'
      when: never
    - when: always
```

### AWS

In this pipeline we support ECR (elastic container registry) and ECS (elastic container service) in AWS. So, we have deploy to ECS and Build-Push to ECR. To more details access this [link](https://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_on_ECS.html). 

### Testing

To validate our CI / CD before deploying, we can use a lint script. This script is located in the ** scripts ** folder and is written in the Ruby language. This script use a gem [gitlab-ci-lint](https://rubygems.org/gems/gitlab-ci-lint). Steps:

1. Install [gitlab-ci-lint](https://rubygems.org/gems/gitlab-ci-lint) gem.
2. Run the script with ruby command.
3. See the result in console.
4. Profit.

### How to contribute

>
> 1. Make a **Fork**.
> 2. Follow the project organization.
> 3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.
> 4. Make the **Commit**.
> 5. Open a **Pull Request**.
> 6. Wait for your pull request to be accepted.. 🚀
>
Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

### Add to git and push

You must send the project to your GitHub after the modifications

```bash
git add -f .
git commit -m "Added - Fixing somethings"
git push origin master
```

### Versioning

- [CHANGELOG](CHANGELOG.md)

### License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

### Author

👤 **Lucca Pessoa**

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

> * Email: luccapsm@gmail.com
> * Website: https://github.com/lpmatos
> * Github: [@lpmatos](https://github.com/lpmatos)
> * LinkedIn: [@luccapessoa](https://linkedin.com/in/luccapessoa)

### Show your support

Give a ⭐️ if this project helped you!

### Project Status

* ✔️ Finish

---

<p align="center">Feito com ❤️ by <strong>Lucca Pessoa :wave:</p>
