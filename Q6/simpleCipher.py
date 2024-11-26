# A simple cipher is built on the alphabet wheel which has uppercase English letters
# ['A'-'Z'] written on It:

# Given an encrypted string consisting of English letters ['A'-'Z'] only, decrypt the string
# by replacing each character with the kth character away on the wheel in the

# counterclockwise direction, Counter-clockwise is the opposite direction in which the
# hands on a clock usually move. (Using python)

def simple_cipher(encrypted, k):
    decrypted = ''
    for char in encrypted:
        new_char = chr((ord(char) - k - 65) % 26 + 65)
        decrypted += new_char
    return decrypted

# รับค่าจากผู้ใช้
encrypted = input("กรุณาป้อนข้อความที่เข้ารหัส: ")
k = int(input("กรุณาป้อนค่า k (จำนวนที่เลื่อนไปในทิศทางทวนเข็มนาฬิกา): "))

# แสดงผลลัพธ์ที่ถอดรหัส
decrypted_message = simple_cipher(encrypted, k)
print("ผลลัพธ์ที่ถอดรหัส:", decrypted_message)

