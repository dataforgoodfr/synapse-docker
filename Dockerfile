# Download the S3 Storage Provider module
FROM matrixdotorg/synapse:latest AS runtime

RUN pip install synapse-s3-storage-provider
