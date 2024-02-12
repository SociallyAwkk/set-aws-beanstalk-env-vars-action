FROM amazon/aws-cli:2.15.19 as builder

COPY src/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

FROM amazon/aws-cli:2.15.19

# Copy only the necessary files from the previous stage
COPY --from=builder /entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]