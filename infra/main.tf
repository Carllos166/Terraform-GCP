# Bucket to store webiste

resource "google_storage_bucket" "website" {
    name = "webiste-terraform-freecodecamp"
    location = "US"
}

# Make new object public

resource "google_storage_object_access_control" "public_role" {
    object = google_storage_object.static_site_src.name
    bucket = google_storage_bucket.website.name
    role = "READER"
    entity = "allUsers"
}

# Upload the html file to the GCP Bucket

resource "google_storage_bucket" "static_site_src" {
    name = "index.html"
    bucket = google_storage_bucket.website.name
    source = "../website/index.html" 
}