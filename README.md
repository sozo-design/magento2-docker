# SOZO Magento Docker Compatibility

This is used to create a local docker environment for project or module development.

Local Testing
`cat ~/git/magento2/magento-docker/lib/freshsetup | bash -s -- magento245-p1.test 2.4.4-p2`

Usage
```
# Create your project directory then go into it:
mkdir -p ~/Sites/magento2.4.5-p1
cd $_

# Run this automated one-liner from the directory you want to install your project.
curl -s https://raw.githubusercontent.com/sozo-design/magento2-docker/master/lib/freshsetup | bash -s -- magento245-p1.test 2.4.5-p1
```