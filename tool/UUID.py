import base64
import uuid
def get_uuid():
    id = base64.b64encode(uuid.uuid4().bytes + uuid.uuid4().bytes)
    print("使用的UUID为"+str(id))
    return id