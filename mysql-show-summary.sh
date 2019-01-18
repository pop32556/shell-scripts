#!/bin/bash

mysqladmin -uda_admin -psm6bs3qj processlist;
tail /var/lib/mysql/mysql-slow-queries.log -n 10
