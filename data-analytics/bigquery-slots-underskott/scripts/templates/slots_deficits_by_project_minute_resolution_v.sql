/*
 Copyright 2017 Google Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/
SELECT
  minute_window AS minute_window,
  project_id AS project_id,
  SUM(pending_units) AS pending_units,
  SUM(active_units) AS active_units
FROM
  `${PROJECT_ID}.slots_deficits.slots_deficits_minute_resolution`
where pending_units > 0 or active_units >0
GROUP BY
  minute_window,
  project_id
ORDER BY
  minute_window