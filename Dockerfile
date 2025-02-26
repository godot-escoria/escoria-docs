FROM python:3-slim

WORKDIR /app

RUN pip3 install setuptools m2r2 lxml

CMD ["bash"]
