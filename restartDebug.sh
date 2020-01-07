#!/bin/bash -x

bin/solr -V stop -all
cp /mnt/home/tpasch/scm/github/lucene-solr/solr/build/contrib/solr-dataimporthandler/solr-dataimporthandler-8.3.2-SNAPSHOT.jar dist/solr-dataimporthandler-8.3.1.jar
cp /mnt/home/tpasch/scm/github/lucene-solr/solr/build/contrib/solr-dataimporthandler-extras/solr-dataimporthandler-extras-8.3.2-SNAPSHOT.jar dist/solr-dataimporthandler-extras-8.3.1.jar
cat example/example-DIH/solr/tika/conf/tika-data-config.xml
bin/solr -V -v -a \"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=18983 -Xdebug\" -e dih
less example/example-DIH/logs/solr.log
