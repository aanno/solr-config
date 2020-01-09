#!/bin/bash -x

SOLR_SRC="/mnt/home/tpasch/scm/github/lucene-solr/solr"
IMPORT_SRC="/mnt/home/tpasch/scm/aanno/solr-import-plugin"
IMPORT_JAR="$IMPORT_SRC/build/libs/solr-import-plugin-all-1.0-SNAPSHOT-all.jar"

curl "http://localhost:8983/solr/tika/update/json?update.chain=import.chain&commit=true" -H 'Content-type: application/json' -d '
[
  {
    "name" : "The Lightning Thief",
    "features" : "This is just a test",
    "cat" : ["book","hardcover"]
  },
  {
    "name" : "The Lightning Thief",
    "features" : "This is just a test",
    "cat" : ["book","hardcover"]
  }
]'
