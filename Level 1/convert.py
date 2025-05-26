import sys
import nbformat

# Load and repair the notebook
with open(sys.argv[1], "r", encoding="utf-8") as f:
    nb = nbformat.read(f, as_version=4)

# Ensure all code cells have 'outputs' and 'execution_count'
for cell in nb.cells:
    if cell.cell_type == "code":
        cell.setdefault("outputs", [])
        cell.setdefault("execution_count", None)

# Save it back
with open(sys.argv[1], "w", encoding="utf-8") as f:
    nbformat.write(nb, f)