#!/bin/bash -x

SOLR_SRC="/mnt/home/tpasch/scm/github/lucene-solr/solr"
DI_JAR="$SOLR_SRC/build/contrib/solr-dataimporthandler/solr-dataimporthandler-8.3.2-SNAPSHOT.jar"
DIE_JAR="$SOLR_SRC/build/contrib/solr-dataimporthandler-extras/solr-dataimporthandler-extras-8.3.2-SNAPSHOT.jar"
DI_SRC="$SOLR_SRC/contrib/dataimporthandler"
DIE_SRC="$SOLR_SRC/contrib/dataimporthandler-extras"

pushd "$DI_SRC"
  ant clean && ant
popd
pushd "$DIE_SRC"
  ant clean && ant
popd

bin/solr -V stop -all
cp "$DI_JAR" dist/solr-dataimporthandler-8.3.1.jar
cp "$DIE_JAR" dist/solr-dataimporthandler-extras-8.3.1.jar
cat example/example-DIH/solr/tika/conf/tika-data-config.xml
bin/solr -V -v -a '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=18983' -a '-Xdebug' -e dih
less example/example-DIH/logs/solr.log
