# SnykCon 2021 Product Track: 
## _Automating Secure Container Workflows_

This is our hapless developer's super secret project - a soon to be world famous game they've been working on.

In the demo, we look specifically at the container components and choices and use Snyk to address issues. Note that Snyk can also address issues with the code and deployment configuration (Kubernetes, in this case), as well.


The original source for this game is the Node 8 multiplayer Snake game:
`https://github.com/simondiep/node-multiplayer-snake.git`
The original README for the source code is available here as [README-original.md](./README-original.md)

The game code here is almost 100% the same code, with the exception of some changes to the color scheme and some UI wording. Added to the code for the purposes of this demo:
* The game runs in a container via the [Dockerfile](./Dockerfile)
* [GitHub Actions](./.github/workflows/snyk-container.yaml) are used to build, test and push the image to Docker Hub
* [Harness](https://harness.io) is used to deploy new versions of the game to a Kubernetes cluster
* [Snyk](https://snyk.io/product/container-vulnerability-management/) is used to test the container images and with that there is some setup policy code for the Snyk Kubernetes monitor as well as a `.snyk` policy file to auto-ignore some vulnerabilities.
* There is also a [deployment.yaml](./deployment.yaml) included here for Kubernetes, although in the demo the deployment is controlled by Harness


## Snyk Ignores
The demo ignores issues that are present and unfixed in a slim variant of the original parent image. To setup the ignore file, use the following command, substituting your preferred image for `node:16.6.2-bullseye-slim`.
```
snyk container test node:16.6.2-bullseye-slim --json | jq  '[.vulnerabilities[] | .id] | unique | .[]' | xargs -L1 -I'{}' snyk ignore --id='{}' --reason="Unfixed base image vulns from preferred slim variant"
```
For extra credit, one could scan an image, parse the output for the base image recs, select a preferred image automatically, then scan that image with code similar to this to generate the `.snyk` file.