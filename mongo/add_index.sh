#!/bin/bash

# creates the additional required index for kobo mongo

DB=formhub
COL=instances

echo "db.$COL.createIndex( { _userform_id: 1 } )" | mongo $DB
