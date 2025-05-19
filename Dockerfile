FROM python:3.9-slim-buster AS build

RUN apt-get update && apt-get install -y git

WORKDIR /app

# Download the S3 Storage Provider module
RUN git clone https://github.com/matrix-org/synapse-s3-storage-provider.git

FROM matrixdotorg/synapse:latest AS runtime

# Copy the s3_storage_provider.py into the RUN image
COPY --from=build /app/synapse-s3-storage-provider/s3_storage_provider.py /usr/local/lib/python3.9/site-packages/

