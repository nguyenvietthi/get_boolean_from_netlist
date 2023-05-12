from anytree import Node, RenderTree
import re
filename = r"./text/addr_conv_l2p_252_netlist.v"
 
cell_regex = r"xor|\bor|and|inv"

def get_line_include_string(sub_string):
    list_line = []
    detect = 0
    with open(filename) as file:
        lines = file.readlines()

    for number, line in enumerate(lines, 1): 
        if sub_string in line: 
            
            if(re.findall("assign", line)):
                list_line.append(re.sub(' +', ' ', line).replace("\n", ""))
            elif(line[-2] != ';'):
                list_line.append(re.sub(' +', ' ',line + lines[number]).replace("\n", ""))
            elif(len(re.findall("dti", line)) == 0):
                if(re.findall("output", line) or re.findall("input", line)):
                    list_line.append(re.sub(' +', ' ', line).replace("\n", ""))
                else:
                    list_line.append(re.sub(' +', ' ', lines[number - 2] + re.sub(' +', ' ',line)[1:]).replace("\n", ""))
            elif(re.findall("dti", line)):
                list_line.append(re.sub(' +', ' ', line).replace("\n", ""))
            
    # for line in list_line:
    #     print(line)
            
    return list_line

def get_list_port(direction):
    port_list = get_line_include_string(direction)
    string_list = []
    for port_string in port_list:
        port = port_string.replace(direction, "")
        port = port.replace("]", "")
        port = port.replace("[", "")
        port = port.replace(":0", "")
        port = port.replace(";", "")
        port_split = port.split(" ")
        for i in range(int(port_split[2]) + 1):
            string_list.append(port_split[-1] + "[" + str(i) + "]")
    # print(string_list)
    return string_list

def get_list_input_ouput_of_subcell(output):
    lines = get_line_include_string(output)
    line = ""
    for _line in lines:
        # print(_line)
        if(re.search("Z\(" + output.replace("[", "\[").replace("]", "\]"), _line)):
            line = _line
            break
    # print(line)
    cell_name = re.search(r"\bdti\w+", line).group()
    port_inst = re.findall(r"\b[A-Z]\(\S+\)", line)

    cell_input = []

    for port in port_inst:
        if(port[0] != "Z"):
            cell_input.append(port[2:-1])
    # print(cell_input, cell_name)
    return cell_input, cell_name

def get_end_list_to_gen_tree():
    input_list = get_list_port("input")
    for number, input in enumerate(input_list):
        lines = get_line_include_string(input)
        if(len(lines) and re.sub(' +', ' ', lines[-1]).split(" ")[1] == "assign"):
            input_list[number] = re.sub(' +', ' ', lines[-1]).split(" ")[2]
    # print(input_list)
    return input_list

def get_tree(pre_node, output_pre):
    info_cell = get_list_input_ouput_of_subcell(output_pre)
    current_node = Node(info_cell[-1], parent=pre_node)
    # print(info_cell)
    for output_curr in info_cell[0]:
        # print(output_curr)
        # print(output_curr in input_list)
        if(output_curr in end_tree_list):
            Node(output_curr, parent=current_node)
        else:
            get_tree(current_node, output_curr)

end_tree_list  = get_end_list_to_gen_tree()


output_list = get_list_port("output")
print(output_list)

for ouput in output_list:
    raw_node = Node(ouput)
    get_tree(raw_node, ouput)
  
    for pre, fill, node in RenderTree(raw_node):
        print("%s%s" % (pre, node.name))


# get_tree_from_output("paddr[0]")
# for output in output_dict:
#     for i in range(output_dict[output]):
#         out_string = output + "[" + str(i) + "]"
#         output_node = Node(out_string)

#         print(get_line_include_string(out_string))


# udo = Node("Udo")
# marc = Node("Marc", parent=udo)
# lian = Node("Lian", parent=marc)
# dan = Node("Dan", parent=udo)
# jet = Node("Jet", parent=dan)
# jan = Node("Jan", parent=dan)
# joe = Node("Joe", parent=dan)

# print(udo)

# print(joe)

# for pre, fill, node in RenderTree(udo):
#     print("%s%s" % (pre, node.name))


# print(udo.children)
