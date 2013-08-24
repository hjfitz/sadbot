print("[me]" .. arg[1])
print(string.format("[me]" .. arg[1]:match( "^%s*(.-)%s*$" )))
