FROM amazon/aws-cli:2.15.19

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]