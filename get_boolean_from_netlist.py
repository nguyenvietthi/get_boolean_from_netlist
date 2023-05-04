from anytree import Node, RenderTree

filename = r"./text/addr_conv_l2p.v"
 
def get_line_include_string(sub_string):
    list_line = []
    with open(filename) as file:
        lines = file.readlines()
    for number, line in enumerate(lines, 1): 
        if sub_string in line: 
            list_line.append(line)
            print(f'Content: {line}')

    return list_line

def get_output_port():
    output_list = get_line_include_string("output")
    output_port = dict()
    for output_string in output_list:
        output = output_string.replace("  output ", "")
        output = output.replace("", "")
        output = output.replace("]", "")
        output = output.replace("[", "")
        output = output.replace(":0", "")
        output = output.replace(";", "")
        output = output.replace("\n", "")

        output_split = output.split(" ")
        output_port[output_split[1]] = int(output_split[0])


        # print(a)
    print(output_port)
    return output_port

get_output_port()






# udo = Node("Udo")
# marc = Node("Marc", parent=udo)
# lian = Node("Lian", parent=marc)
# dan = Node("Dan", parent=udo)
# jet = Node("Jet", parent=dan)
# jan = Node("Jan", parent=dan)
# joe = Node("Joe", parent=dan)

# print(udo)

# print(joe)

# get_line_include_string("end")
# for pre, fill, node in RenderTree(udo):
#     print("%s%s" % (pre, node.name))


# print(udo.children)
