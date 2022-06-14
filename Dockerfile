#  Copyright 2020 The Kale Authors
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# Use tensorflow-1.14.0 based image with Rok as a base image
FROM gcr.io/arrikto/jupyter-kale-py38:release-1.5-l0-release-1.5-rc4-4-gbc3c6f09d

USER root

# Install custom dependencies
RUN apt-get update

RUN apt-get install -y tesseract-ocr tesseract-ocr-deu libtesseract-dev libleptonica-dev
RUN apt-get install -y poppler-utils
RUN apt-get install -y libopencv-dev



RUN echo "jovyan ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/jovyan
WORKDIR /home/jovyan
USER jovyan

CMD ["sh", "-c", \
     "jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser \
      --allow-root --port=8888 --LabApp.token='' --LabApp.password='' \
      --LabApp.allow_origin='*' --LabApp.base_url=${NB_PREFIX}"]
