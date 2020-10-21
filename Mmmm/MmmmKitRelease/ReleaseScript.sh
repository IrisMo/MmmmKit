#!/bin/sh

#  ReleaseScript.sh
#  BeaconPlusSwiftUI
#
#  Created by SACRELEE on 2/7/18.
#  Copyright © 2018 MinewTech. All rights reserved.

echo "*********************************************************"
echo "      Start [MmmmKit] SDK Release Script            "
echo "*********************************************************"
UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/Release-universal

echo "*********************************************************"
echo "      1. Creating Universal folder                       "
echo "*********************************************************"
# make sure the output directory exists
mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"


echo "*********************************************************"
echo "      2. Building Frameworks for ARM & x86               "
echo "*********************************************************"
# 1. Build Device and Simulator versions on iOS
xcodebuild -workspace "${PROJECT_NAME}.xcworkspace" -scheme "MmmmKit" -configuration "Release" -sdk iphonesimulator -verbose
xcodebuild -workspace "${PROJECT_NAME}.xcworkspace" -scheme "MmmmKit" -configuration "Release" -sdk iphoneos -verbose


echo "*********************************************************"
echo "      3. Merging Universal Frameworks                    "
echo "*********************************************************"
# 2. create universal framework
lipo -create "${BUILD_DIR}/Release-iphoneos/MmmmKit.framework/MmmmKit" "${BUILD_DIR}/Release-iphonesimulator/MmmmKit.framework/MmmmKit" -output "${BUILD_DIR}/MmmmKit";
echo "*********************************************************"
echo "      4. Creating Zip For ARM                            "
echo "*********************************************************"
# 3.create framework for ARM.
now_date=$(date +"%Y.%m.%d %I_%M%p")
now_dir="${PROJECT_DIR}/MmmmKitRelease/MergedZip/[iOS]MmmmKit ${now_date}"
tmp_dir="[iOS]MmmmKit ${now_date}"

inner_dir="temp_folder"
cd "${PROJECT_DIR}/MmmmKitRelease/MergedZip/"
mkdir "${tmp_dir}"
cd "${BUILD_DIR}/Release-iphoneos/"
mkdir "${inner_dir}"
cp -R "MmmmKit.framework" "${inner_dir}/"
cd "${inner_dir}"
tar cvf ARM.tar "MmmmKit.framework"
mv "ARM.tar" "${now_dir}/[iOS]MmmmKit ARM ${now_date}.tar"

echo "*********************************************************"
echo "      5. Creating Universal Frameworks                   "
echo "*********************************************************"
# 4. Copy the framework structure (from iphoneos build) to the universal folder
mv -v "${BUILD_DIR}/Release-iphoneos/MmmmKit.framework" "${UNIVERSAL_OUTPUTFOLDER}"
# 5. Create universal binary file using lipo and place the combined executable in the copied framework directory
mv -v "${BUILD_DIR}/MmmmKit" "${UNIVERSAL_OUTPUTFOLDER}/MmmmKit.framework"
echo "*********************************************************"
echo "      6. Creating Zip For ARM & x86                      "
echo "*********************************************************"
# 6. create a Zip file.
cd "${UNIVERSAL_OUTPUTFOLDER}"
tar cvf Merged.tar MmmmKit.framework
echo "*********************************************************"
echo "      7. Opening Folder                            "
echo "*********************************************************"
# 7. move to project folder.
mv -v "${UNIVERSAL_OUTPUTFOLDER}/Merged.tar" "${now_dir}/[iOS]MmmmKit x86&ARM ${now_date}.tar"

# 9. open folder.
open "${PROJECT_DIR}/MmmmKitRelease/MergedZip/"

echo "*********************************************************"
echo "      8. Cleaning Temp files                             "
echo "*********************************************************"
# 10. clean temp files
cd "${BUILD_DIR}"
rm -rf "Release-iphoneos"
rm -rf "Release-iphonesimulator"
rm -rf "${UNIVERSAL_OUTPUTFOLDER}"

echo "*********************************************************"
echo "      9. All Done, Buddy!                                "
echo "*********************************************************"
