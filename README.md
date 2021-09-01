# SnykCon 2021 Product Track: 
## _Automating Secure Container Workflows_

This is our hapless developer's super secret project - a soon to be world famous game they've been working on.

In the demo, we look specifically at the container components and choices and use Snyk to address issues. Note that Snyk can also address issues with the code and deployment configuration (Kubernetes, in this case), as well.


The original source for this game is the Node 8 multiplayer Snake game:
`https://github.com/simondiep/node-multiplayer-snake.git`

Uses GH Actions to build and test the image; Harness to deploy.


## Snyk Ignores
The demo ignores issues that are present and unfixed in a slim variant of the original parent image. To setup the ignore file, use the following command, substituting your preferred image for `node:16.6.2-bullseye-slim`.
```
snyk container test node:16.6.2-bullseye-slim --json | jq  '[.vulnerabilities[] | .id] | unique | .[]' | xargs -L1 -I'{}' snyk ignore --id='{}' --reason="Unfixed base image vulns from preferred slim variant"
```
For extra credit, the original base could be scanned, the output parsed for the base image recs, and a preferred image could be selected automatically and scanned.