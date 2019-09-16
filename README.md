# Welcome to the Open Chaos Experiment Catalog!

This is a free, public and community-contributed catalog of chaos engineering experiments.

## Catalog Layout and Experiment Format

The format of the catalog is relatively flexible, being a resource that will index many different types of experiments and even potentially different experiment-executing tools and systems. The current convention, where applicable, for a new experiment to be added to the catalog are:

1. Every experiment should reside in its own directory below the top level of the catalog.

   Due to the indexable nature of tags, every experiment is searchable and groupable based on these labels.

2. Top level `tags` for an experiment are recommended to be `Platform` and `Service`, with a corresponding descriptor after a `:`.

   Platform specifies the overall platform being targetted or manipulated by the experiment, for example `Platform:kubernetes`. `Service`, where applicable, specifies any sub-service of the platform being employed, such as `Service:node`. Any combination of `Platform:*` and `Service:*` tags may be used for a single experiment so that it is appropriately indexed for catalog searching.

3. A `README.md` is recommended, following the general template form as show by the [`file-must-not-disappear` experiment sample](file-must-not-disappear/README.md).

4. Optionally Yaml as well as JSON can be provided as the preferred format of an experiment, according to an author's tastes. However it is advised to submit both formats if possible.

## Contributing to this Experiment Catalog

If you wish to contribute to this experiment catalog, you are more than welcome to do so. Please, fork this project, make your changes, and submit a PR for review.

This project also requires all contributors must sign a
[Developer Certificate of Origin][dco] on each commit they would like to merge into the master branch of the repository. Please, make sure you can abide by the rules of the DCO before submitting a PR.

[dco]: https://github.com/probot/dco#how-it-works
