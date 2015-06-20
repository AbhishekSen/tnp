#!/bin/bash
filename="/opt/IITG-PROJECT/SW-IIT/placement_uploads/status/AllOrg_Status.zip"
studfilename="/opt/IITG-PROJECT/SW-IIT/placement_uploads/status/AllStudents.csv"
rm $filename
rm $studfilename
/usr/bin/zip -9 -r -j $filename /opt/IITG-PROJECT/SW-IIT/placement_uploads/status/*.csv

exit 0;
