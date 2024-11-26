# Check duplicate items from list A and list B and append to a new list. Using your preferred programming language.
list_a = [1, 2, 3, 5, 6, 8, 9]
list_b = [3, 2, 1, 5, 6, 0]

# หารายการซ้ำโดยใช้ set
duplicates = list(set(list_a) & set(list_b))
# แสดงผลรายการที่ซ้ำ
print("รายการที่ซ้ำ:", duplicates)
