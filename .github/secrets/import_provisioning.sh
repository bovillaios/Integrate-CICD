#!/bin/sh

# Decrypt the files
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$provisioning_password" --output ./.github/secrets/AppStoreCertificates.p12 ./.github/secrets/AppStoreCertificates.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$provisioning_password" --output ./.github/secrets/CocoaHeadsNL-AppStore.mobileprovision ./.github/secrets/CocoaHeadsNL-AppStore.mobileprovision.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

echo "List profiles"
ls ~/Library/MobileDevice/Provisioning\ Profiles/
echo "Move profiles"
cp ./.github/secrets/CocoaHeadsNL-AppStore.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
echo "List profiles"
ls ~/Library/MobileDevice/Provisioning\ Profiles/

security create-keychain -p "" build.keychain
security import ./.github/secrets/AppStoreCertificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$provisioning_password" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
