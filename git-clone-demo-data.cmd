:: If c:\Utilities does not exist, create it
if not exist "c:\Utilities" (
    mkdir "c:\Utilities"
)

git clone https://github.com/CostelloTechnicalConsulting/demo-data.git c:\Utilities\demo-data