from openpyxl import load_workbook


wb = load_workbook(filename="C://Users//jansr//Downloads//Miscellaneous_Technologies//moulton//see.xlsx", keep_vba='false')
xlWorkSheet = wb.active
strPat = xlWorkSheet['F2']
print(strPat)
wb.save("C://Users//jansr//Downloads//Miscellaneous_Technologies//moulton//see.xlsx")

