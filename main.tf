provider "google" {
  credentials = file("C:/Users/Chouki_Omar/Downloads/eternal-splicer-432020-h2-7220d97f933d.json")
  project     = "eternal-splicer-432020-h2"
  region      = "us-central1"
}

resource "google_bigquery_dataset" "test_dataset" {
  dataset_id                  = "test_dataset"
  location                    = "US"
  description                 = "A new description"
  default_table_expiration_ms = 3600000 # 1 hour
}


output "dataset_id" {
  value = google_bigquery_dataset.test_dataset.dataset_id
}
