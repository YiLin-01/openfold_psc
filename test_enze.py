import json

if __name__ == "__main__":
    # with open("OpenProteinSet/alignment_data/alignment_dbs/alignment_db.index", "r") as f:
    #     index = json.load(f)
    # index = dict(index)
    # print(len(index.keys()))

    with open("test_save.txt", "r", encoding="latin-1") as f:
        lines = f.readlines()
    lines = [item for item in lines if item[0] == "@"]
    print(len(lines))
