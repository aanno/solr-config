# Solr plugin package manager

## Starting with manager enabled

See https://lucene.apache.org/solr/guide/8_4/package-manager.html:

```bash
bin/solr -Denable.packages=true -e cloud
```

## File upload

Example _without_ signing. See https://lucene.apache.org/solr/guide/8_4/package-manager-internals.html for doing that.

```bash
curl -o runtimelibs.jar   -LO https://github.com/apache/lucene-solr/blob/master/solr/core/src/test-files/runtimecode/runtimelibs.jar.bin?raw=true
curl --data-binary @runtimelibs.jar -X PUT  http://localhost:7574/api/cluster/files/mypkg/1.0/myplugins.jar
```

## Package creation

Package is creation is adding a JSON description for the files form a package. However, package create can be done only 
for files _with signature_.

## Package repository

Currently, there seems to be no (working) Solr package repository. Hence `bin/solr package add-repo <name/> <url/>` is of no use. 
