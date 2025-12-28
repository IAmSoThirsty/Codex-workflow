"""
Test cases for Codex Deus Maximus
"""
import os
import sys
import pytest
from unittest.mock import patch, MagicMock


# Import the module to test
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))
from codex.codex_deus_maximus import main


class TestCodexDeusMaximus:
    """Test suite for the Schematic Guardian"""

    def test_main_with_valid_structure(self, tmp_path, monkeypatch):
        """Test main function when all required directories exist"""
        # Create required directories
        (tmp_path / ".github" / "workflows").mkdir(parents=True)
        (tmp_path / "src").mkdir()
        
        # Change to temp directory
        monkeypatch.chdir(tmp_path)
        
        # Should not raise any exceptions
        main()

    def test_main_missing_github_workflows(self, tmp_path, monkeypatch):
        """Test main function when .github/workflows directory is missing"""
        # Only create src directory
        (tmp_path / "src").mkdir()
        
        # Change to temp directory
        monkeypatch.chdir(tmp_path)
        
        # Should exit with code 1
        with pytest.raises(SystemExit) as exc_info:
            main()
        assert exc_info.value.code == 1

    def test_main_missing_src(self, tmp_path, monkeypatch):
        """Test main function when src directory is missing"""
        # Only create .github/workflows directory
        (tmp_path / ".github" / "workflows").mkdir(parents=True)
        
        # Change to temp directory
        monkeypatch.chdir(tmp_path)
        
        # Should exit with code 1
        with pytest.raises(SystemExit) as exc_info:
            main()
        assert exc_info.value.code == 1

    def test_main_missing_both_directories(self, tmp_path, monkeypatch):
        """Test main function when both directories are missing"""
        # Change to temp directory (no directories created)
        monkeypatch.chdir(tmp_path)
        
        # Should exit with code 1
        with pytest.raises(SystemExit) as exc_info:
            main()
        assert exc_info.value.code == 1

    @patch('codex.codex_deus_maximus.logger')
    def test_logging_output(self, mock_logger, tmp_path, monkeypatch):
        """Test that appropriate log messages are generated"""
        # Create required directories
        (tmp_path / ".github" / "workflows").mkdir(parents=True)
        (tmp_path / "src").mkdir()
        
        # Change to temp directory
        monkeypatch.chdir(tmp_path)
        
        # Run main
        main()
        
        # Verify logging calls
        assert mock_logger.info.called
        mock_logger.info.assert_any_call("Initializing Schematic Enforcement Protocol...")
