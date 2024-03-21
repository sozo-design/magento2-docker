# SOZO Magento Docker Compatibility v1.0.0

This is used to create a local docker environment for module development and testing.

Usage

```shell
# Create your project directory then go into it:
mkdir -p ~/Sites/magento2.4.6-p3
cd $_

# Run this automated one-liner from the directory you want to install your project.
# Replace magento245-p1.test with the local domain you want to use
# Replace 2.4.5-p1 with the version of Magento you want to install
curl -s https://raw.githubusercontent.com/sozo-design/magento2-docker/main/lib/freshsetup | bash -s -- magento246-p3.test 2.4.6-p3
```
