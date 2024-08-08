# Change below values accordingly to you setup

# This is the URL base to access your Drumee Instance
# It's recommanded not to share the domain name 
# with any oher applications
export DRUMEE_DOMAIN_NAME=""

# Fix IPV4 address bound to your doamain_name
export PUBLIC_IP4=""

# IPV6 address bound to your doamain_name
export PUBLIC_IP6=""

# This email will be use as the admin account
export ADMIN_EMAIL=""

# Dedicated to data base server. Do not share with any
# other application. Default value is /srv/db. 
# At least 100GB should be allocated 
export DRUMEE_DB_DIR="" 

# Dedicated to Drumee Filesystem Management. 
# Do not share with any # other application. 
# Default value is /data 
# At least 100GB should be allocated 
export DRUMEE_DATA_DIR="" # defaulted to /data 

# Optional setting
# Drumee use rsync to backup data (FMS, DB and configs)
# If you plan to make a backup on a remote host, ensure
# ssh keys are properly setup
export STORAGE_BACKUP="" # [user@host-or-ip:]/path/

# This text will be shown on the login page
export DRUMEE_DESCRIPTION="My Drumee Box"

# If not set, will be defaulted to ADMIN_EMAIL.
# SSL certificates are generated using zerossl.com ACME server
# This requires an emal to be provided.
export ACME_EMAIL_ACCOUNT="" 
