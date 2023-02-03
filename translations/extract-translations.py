import json
import os

# create a new JSON object
data = {}

# specify the directory to traverse
ui_dirs = [
    "./admin-country-ui/src",
    "./admin-global-ui/src",
    "./provider-ui/src",
    "./client-ui/src",
    "./website/src",
]

server_dirs = [
    "./user/service/translations"
]

def get_ui_translations():
    # traverse all directories and subdirectories
    for directory in ui_dirs:
        for subdir, dirs, files in os.walk(directory):
            all_jsons = [x for x in files if x.endswith('.json')]
            for file in [x for x in files if x.endswith('.json')]:
                # check if the file has a .json extension
                if file.endswith('.json') and file == 'en.json':
                    # get the file's full path
                    file_path = os.path.join(subdir, file)
                    # open the file and get its contents
                    with open(file_path) as json_file:
                        file_data = json.load(json_file)

                        folder = subdir.split('/')[-2]
                        platform = subdir.split('/')[1]
                        group = subdir.split('/')[3]

                        if not platform in data:
                            data[platform] = {group: {folder: file_data}}
                        else:
                            if group in data[platform]:
                                data[platform][group].update({folder: file_data})
                            else:
                                data[platform][group] = {folder: file_data}
get_ui_translations()


js_file = open('./translations/uiTranslations.json', 'w')
js_file.write(json.dumps(data))
js_file.close()