# Đường dẫn đến thư mục dotfiles của bạn
DOTFILES_DIR := $(HOME)/dotfiles

# Danh sách các thư mục trong dotfiles, bao gồm cả thư mục ẩn, loại trừ .git và Makefile
PACKAGES := $(filter-out .git Makefile .gitignore,$(shell cd $(DOTFILES_DIR) && ls -A))

# Mục tiêu mặc định
.PHONY: all
all: stow

# Tạo symlink cho tất cả các package
.PHONY: stow
stow:
	@echo "Tạo symlink cho tất cả dotfiles (bao gồm thư mục ẩn)..."
	@cd $(DOTFILES_DIR) && stow -v $(PACKAGES)
	@echo "Hoàn thành!"

# Hủy symlink cho tất cả các package
.PHONY: unstow
unstow:
	@echo "Hủy symlink cho tất cả dotfiles (bao gồm thư mục ẩn)..."
	@cd $(DOTFILES_DIR) && stow -D -v $(PACKAGES)
	@echo "Hoàn thành!"

# Hiển thị trợ giúp
.PHONY: help
help:
	@echo "Sử dụng:"
	@echo "  make stow   - Tạo symlink cho tất cả dotfiles (bao gồm thư mục ẩn)"
	@echo "  make unstow - Hủy symlink cho tất cả dotfiles (bao gồm thư mục ẩn)"
	@echo "  make tree   - Hiển thị cấu trúc thư mục (3 cấp, bỏ qua .git)"
	@echo "  make help   - Hiển thị thông tin trợ giúp này"
	@echo "  make list   - Hiển thị danh sách các package sẽ được stow"

# Hiển thị danh sách các package sẽ được stow
.PHONY: list
list:
	@echo "Các package sẽ được stow (bao gồm thư mục ẩn):"
	@echo $(PACKAGES)

# Hiển thị cấu trúc thư mục sử dụng tree
.PHONY: tree
tree:
	@echo "Cấu trúc thư mục dotfiles (3 cấp, bỏ qua .git):"
	@tree -L 3 -a -I ".git" $(DOTFILES_DIR)
