<p align="center">
  <img alt="gitlab-runner" src="https://miro.medium.com/max/264/1*0lzbnKgE5ILm4gctPH-EJg.jpeg" width="250px" float="center"/>
</p>

<h1 align="center">Pipeline Windows</h1>

<p align="center">
  <strong>Pipeline that support Windows Images in Build Docker</strong>
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

### Description

When we are working with continuous delivery methodologies, we have two extremely important concepts that need to be understood and differentiated: internships and jobs.

Basically, the stages of a pipeline will be the organizers of the job execution flow. In GitLab the stages are described in a file called .gitlab-ci.yml, along with the jobs. This file is interpreted by an external plugin called GitLab Runner that is responsible for raising what is necessary from the "hardware" point of view to run the jobs. Finally, we have the jobs, which represent the execution of our tasks within our wake.

<p align="center">
  <img alt="gitlab-ci" src="https://docs.gitlab.com/ee/ci/introduction/img/gitlab_workflow_example_extended_v12_3.png" width="950px" float="center"/>
</p>

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
