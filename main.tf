provider "google" {
  credentials = file("C:/Users/Chouki_Omar/Downloads/eternal-splicer-432020-h2-7220d97f933d.json")
  project     = "eternal-splicer-432020-h2"
  region      = "us-central1"
}

resource "google_bigquery_dataset" "test_dataset" {
  dataset_id                  = "test_dataset_"
  location                    = "US"
  description                 = "A new description"
  default_table_expiration_ms = 3600000 # 1 hour
}


output "dataset_id" {
  value = google_bigquery_dataset.test_dataset.dataset_id
}

resource "google_bigquery_table" "test_table" {
  dataset_id = google_bigquery_dataset.test_dataset.dataset_id
  table_id   = "test_table"
  project    = "eternal-splicer-432020-h2"

  schema = jsonencode([
    {
      "name" = "id"
      "type" = "INTEGER"
      "mode" = "REQUIRED"
    },
    {
      "name" = "name"
      "type" = "STRING"
      "mode" = "NULLABLE"
    },
    {
      "name" = "created_at"
      "type" = "TIMESTAMP"
      "mode" = "NULLABLE"
    }
  ])

  # Vous pouvez ajouter des données de test directement à la création de la table avec des options comme 'external_data_configuration'
}

resource "google_bigquery_table" "test_table_2" {
  dataset_id = google_bigquery_dataset.test_dataset.dataset_id
  table_id   = "test_table"
  project    = "eternal-splicer-432020-h2"

  schema = jsonencode([
    {
      "name" = "id"
      "type" = "INTEGER"
      "mode" = "REQUIRED"
    },
    {
      "name" = "name"
      "type" = "STRING"
      "mode" = "NULLABLE"
    },
    {
      "name" = "created_at"
      "type" = "TIMESTAMP"
      "mode" = "NULLABLE"
    }
  ])

  # Vous pouvez ajouter des données de test directement à la création de la table avec des options comme 'external_data_configuration'
}
