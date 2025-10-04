FROM pytorch/pytorch:2.8.0-cuda12.9-cudnn9-runtime

RUN apt-get update
RUN apt-get install -y libxrender1 libsm6 libxext6
RUN pip install casanovo

WORKDIR /workspace
ADD src/run.sh  .

RUN casanovo configure --output_dir .

CMD [ "bash", "run.sh" ]
