# This is used to compare the port generated in the AB and Developer;
# such as the InpAdpt, OutpAdpt

# we shall first keep the ports lists in the xls
# if the ports is inconsistent, we shall prompt, and then result xls is forced to be opened;
# import the Library for xml
from xmllib import xmlns
from lxml import etree
import xml.etree.ElementTree as ET
import datetime
# import libarary for openpyxl
from xlutils.copy import copy
from xlwt.Workbook import Workbook
from lxml.html.diff import NoDeletes
from Tix import COLUMN
from _ast import Module
from types import ModuleType
from collections import Counter
# parse the xml
# first find the main node
# about the nodes, we shall first find the main node;
# under the main node, we shall parse the detail node element
nodePort = [
   ".//ELEMENTS/SENDER-RECEIVER-INTERFACE",
   ".//PORTS/P-PORT-PROTOTYPE",
   ".//PORTS/R-PORT-PROTOTYPE",
   ".//VARIABLE-ACCESS/ACCESSED-VARIABLE/AUTOSAR-VARIABLE-IREF"
]
# the detail node
nodeElement = [
   ".//DATA-ELEMENTS/VARIABLE-DATA-PROTOTYPE/TYPE-TREF",
   './/PROVIDED-COM-SPECS/NONQUEUED-SENDER-COM-SPEC/DATA-ELEMENT-REF',
   './/REQUIRED-COM-SPECS/NONQUEUED-RECEIVER-COM-SPEC/DATA-ELEMENT-REF',
   ".//PORT-PROTOTYPE-REF"
]
dpa = "D:\Study_Geea2_Vision_Integrity\config\dpa\TEST\\test.dpa"

if __name__ == "__main__":
   
      # begin to parse the xml
      targetTree = etree.parse(dpa)
      root = targetTree.getroot()
      ns = root.nsmap

      nodeToBeFind = ".//EcucSplitter/"
      for elementTarget in targetTree.findall(nodeToBeFind):
            # moduleName = elementTarget.find('Module')
            if elementTarget.attrib:
               indexConfig = elementTarget.attrib['File'].find('\Config')
               fixedElement = '.' + elementTarget.attrib['File'][indexConfig:]
               elementTarget.attrib['File'] = fixedElement
      eTree = etree.ElementTree(root)
      writeContent = etree.ElementTree(root)
      writeContent.write(dpa, pretty_print = True)
      
      print "finish"
      
      # create the hypelink
      # workSheet.cell(row=current_row-1, column=1).value = "Return to Index Sheet"
      # workSheet.cell(row=current_row - 1, column=1).hyperlink = "#Index_Sheet!A1"
      # for elementTarget in targetTree.findall(nodeProcess, ns):
      #    portName = elementTarget.find('SHORT-NAME', ns)
      #    dataElement = elementTarget.find(nodeElementProcess, ns)
      #    if None == dataElement:
      #       # openpyxl shall write from index = 1
      #       workSheet.cell(row=current_row, column=current_column).value = portName.text
      #       workSheet.cell(row=current_row, column=(current_column + 1)).value = "NULL"
      #       resultText = "NULL"
      #    #             print "%s NULL"%current_row
      #    else:
      #       workSheet.cell(row=current_row, column=current_column).value = portName.text
      #       toBeProcess = dataElement.text
      #       splitList = toBeProcess.split('/')
      #       resultText = splitList[splitProcess]
      #       workSheet.cell(row=current_row, column=(current_column + 1)).value = resultText
      #
      #    if True == judgePortNameStyle(portName.text):
      #       styleNeedToModify = True
      #       portNameToBeModifiedList.append(portName.text)
      #    else:
      #       styleNeedToModify = False
      #    # workSheet.cell(row = current_row, column = (current_column + 2)).value = styleNeedToModify
      #    #             to do: when the module is Inp/Out, we shall record the info to the global variable
      #    recordCompareContent(sheetName[sheetIndex], portName.text, resultText)
      #    current_row = current_row + 1

   # add the port access list
   # no need to parse the latest 4 arxmls from develop


