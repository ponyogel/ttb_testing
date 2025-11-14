def simpleCipher(encrypted, k):
    result = ""
    for ch in encrypted:
        # หาตำแหน่งเลข 0-25
        idx = ord(ch) - ord('A')
        
        # ถอยหลัง k ตำแหน่ง
        new_idx = (idx - k) % 26
        
        # แปลงกลับเป็นตัวอักษร
        result += chr(new_idx + ord('A'))
        
    return result

print(simpleCipher("VTAOG", 2))