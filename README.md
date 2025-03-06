# README

## Image Transformer

A Ruby on Rails app for uploading and transforming images (compression, PNG conversion, black & white). Built with Shrine and ImageProcessing.

## Features

- Upload JPEG images
- Compress images (1% to 100%)
- Convert images to PNG or black & white.
- Download transformed images.

Requirments

- Ruby 3.0
- Rails 7.2
- PostgreSQL

* System dependencies

  - libvips

## Setup

1. Clone the repo:

- git clone https://github.com/your-username/image-transformer.git

- cd image-transformer

2. Install dependencies:

- bundle install
- brew install vips

3. Set up the database:

- rails db:create
- rails db:migrate

4. Run the app:

- rails server
- Visit http://localhost:3000
