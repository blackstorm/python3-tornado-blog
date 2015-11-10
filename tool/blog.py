import re
def summary(list):
    for l in list:
        pattern = re.compile('<p.*?/p>')
        l['content'] = pattern.findall(l['content'])[0]
        print(l['content'])
    return list