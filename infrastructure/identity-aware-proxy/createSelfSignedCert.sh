# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

which openssl
if [[ $? != 0 ]] ; then
echo "This script requires openssl to be installed"
exit 1
fi

mkdir ssl_cert;
cd ssl_cert;
openssl genrsa -out sample.key 2048;
openssl req -new -key sample.key -out sample.csr;
openssl x509 -req -days 365 -in sample.csr -signkey sample.key -out selfSigned.crt;
