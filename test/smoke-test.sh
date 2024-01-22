#!/bin/bash -e

STD_APP_URL=$1
echo "Running smoke test: ${STD_APP_URL}"

echo "=== Store Readings ==="
SMART_METER_ID="smart-meter-0"
curl -s -X POST "${STD_APP_URL}/readings/store" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "smartMeterId": "${SMART_METER_ID}",
  "electricityReadings": [
    {
      "time": "2020-11-18T08:00:00.725202Z",
      "reading": 0.0503
    },
    {
      "time": "2020-11-18T08:00:00.725202Z",
      "reading": 0.0213
    }
  ]
}
EOF
echo


echo "=== Get Stored Readings ==="
curl -s "${STD_APP_URL}/readings/read/${SMART_METER_ID}" | jq .




echo "Done!"