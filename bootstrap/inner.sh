#!/bin/sh

set -ex

if ! type knife >/dev/null 2>&1; then
    curl -L https://www.opscode.com/chef/install.sh | bash
fi

cat > /etc/chef/solo.rb <<EOF
file_cache_path "/home/ubuntu/chef-solo/"
cookbook_path "/home/ubuntu/chef-repo/cookbooks"
EOF

chef-solo -c /etc/chef/solo.rb -j /etc/chef/site.json
