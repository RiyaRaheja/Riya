import tkinter as tk
import math

class Calculator(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Simple Calculator")
        self.geometry("400x600")

        self.result_var = tk.StringVar()
        self.create_widgets()

    def create_widgets(self):
        # Entry for showing the result
        entry = tk.Entry(self, textvariable=self.result_var, font=("Arial", 24), bd=10, insertwidth=2, width=14, borderwidth=4)
        entry.grid(row=0, column=0, columnspan=4)

        
        buttons = [
            ('7', 1, 0), ('8', 1, 1), ('9', 1, 2), ('/', 1, 3),
            ('4', 2, 0), ('5', 2, 1), ('6', 2, 2), ('*', 2, 3),
            ('1', 3, 0), ('2', 3, 1), ('3', 3, 2), ('-', 3, 3),
            ('0', 4, 0), ('.', 4, 1), ('=', 4, 2), ('+', 4, 3),
            ('C', 5, 0),  # Clear button
            ('√', 5, 1),  # Square root button
            ('log', 5, 2)  # Logarithm button
        ]

        for (text, row, column) in buttons:
            button = tk.Button(self, text=text, padx=20, pady=20, font=("Arial", 18),
                               command=lambda t=text: self.on_button_click(t))
            button.grid(row=row, column=column)

    def on_button_click(self, char):
        if char == 'C':
            self.result_var.set('')
        elif char == '=':
            self.calculate_result()
        elif char == '√':
            self.calculate_square_root()
        elif char == 'log':
            self.calculate_logarithm()
        else:
            current_text = self.result_var.get()
            self.result_var.set(current_text + char)

    def calculate_result(self):
        expression = self.result_var.get()
        if expression:
            result = self.safe_eval(expression)
            self.result_var.set(result)

    def calculate_square_root(self):
        try:
            value = float(self.result_var.get())
            result = math.sqrt(value)
            self.result_var.set(result)
        except ValueError:
            self.result_var.set("Error")

    def calculate_logarithm(self):
        try:
            value = float(self.result_var.get())
            result = math.log10(value)  
            self.result_var.set(result)
        except ValueError:
            self.result_var.set("Error")

    def safe_eval(self, expression):
        try:
            
            allowed_chars = set("0123456789+-*/. ")
            if set(expression) - allowed_chars:
                return "Error"  

      
            result = eval(expression)
            return result
        except:
            return "Error"

if __name__ == "__main__":
    app = Calculator()
    app.mainloop()
