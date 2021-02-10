import matplotlib.pyplot as plt
import numpy as np


def initialize_grid(figsize=(6, 6)):
    fig, ax = plt.subplots(figsize=figsize)
    
    # where do we want lines
    ticks = np.arange(-10, 10, 1)
    
    # draw grid
    ax.set_xticks(ticks)
    ax.set_yticks(ticks)
    ax.grid(True, which='both')
    
    # 1-1 X and Y proportion
    ax.set_aspect('equal')
    
    # X and Y axes
    ax.axhline(y=0, color='k')
    ax.axvline(x=0, color='k')
    
    # set axes' limits
    ax.set_xlim([-10, 10])
    ax.set_ylim([-10, 10])
