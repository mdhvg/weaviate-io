import pytest
import utils


@pytest.mark.pyv4
@pytest.mark.parametrize(
    "script_loc",
    [
        "./_includes/code/generative.groupedtask.examples.py",
        "./_includes/code/generative.singleprompt.examples.py",
    ],
)
def test_on_blank_instance_py(empty_weaviates, script_loc):
    proc_script = utils.load_and_prep_script(script_loc)
    exec(proc_script)
