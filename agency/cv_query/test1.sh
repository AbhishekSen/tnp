#!/bin/bash
rm -f /opt/IITG-PROJECT/SW-IIT/placement_uploads/student/uploads/${1}.zip
/usr/bin/zip -9 -j -r /opt/IITG-PROJECT/SW-IIT/placement_uploads/student/uploads/${1}.zip /opt/IITG-PROJECT/SW-IIT/placement_uploads/student/uploads/${1}/*.pdf
exit 0;
