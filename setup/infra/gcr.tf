/**
 * Copyright 2021 The Selkies Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_pubsub_topic" "gcr" {
  name = "gcr"
}

resource "google_pubsub_topic_iam_member" "broker" {
  project = var.project_id
  topic   = google_pubsub_topic.gcr.name
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}