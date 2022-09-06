# Documentation handling

This documentation is generated with [MkDocs](https://www.mkdocs.org).  
The main purpose is to have the documentation an organic part of the product.

## Requirements

MkDocs is instaled with Python PiP

``` shell
pip3 install mkdocs mkdocs-material

```

## Development

You can serve the documentation with auto-refresh:

``` shell
mkdocs serve
```

To build the docs into site folder:

``` shell
mkdocs build
```

## Deployment

To deploy the documentation os GitHub page:

``` shell
mkdocs gh-deploy
```

This will create or update a branch named `gh-pages` and push it to origin.  
GitHub will automatically detect this branch and parse it as a github page.
