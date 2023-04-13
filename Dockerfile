FROM  nvcr.io/nvidia/pytorch:22.07-py3
# maybe we also have a requirements.txt file
# COPY ./requirements.txt /workspace/requirements.txt
# RUN pip install -r requirements.txt
RUN pip install streamlit streamlit_chat openai sentence_transformers pandas
COPY ./NLP4EO /workspace/project
WORKDIR /workspace/project
EXPOSE 80
ENTRYPOINT ["streamlit", "run", "arxiv_src/streamlit_app.py", "--server.port=80", "--server.fileWatcherType=none"]
# docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p 80:80 streamlit
# Do not use link generated by streamlit but go to ip address of VM