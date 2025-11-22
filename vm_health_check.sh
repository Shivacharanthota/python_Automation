#!/bin/bash

# VM Health Check Script
# This script analyzes the health of a virtual machine based on CPU, memory, and disk space utilization
# If any resource is over 60% utilized, the VM is declared as "Non-Healthy"
# If all resources are under 60% utilized, the VM is declared as "Healthy"

# Function to get CPU usage percentage
get_cpu_usage() {
    # Using top command to get CPU idle percentage, then calculate used percentage
    # Try first format: %Cpu(s): ... id
    cpu_idle=$(top -bn1 | grep -i "cpu(s)" | sed 's/,//g' | awk '{for(i=1;i<=NF;i++) if($i=="id") print $(i-1)}' | head -1)
    
    # Ensure cpu_idle has a valid value, default to 0 if empty
    if [ -z "$cpu_idle" ]; then
        cpu_idle=0
    fi
    
    # Calculate CPU usage (100 - idle)
    cpu_usage=$(awk "BEGIN {printf \"%.2f\", 100 - $cpu_idle}")
    echo "$cpu_usage"
}

# Function to get memory usage percentage
get_memory_usage() {
    # Using free command to get memory usage
    memory_usage=$(free | grep Mem | awk '{printf "%.2f", ($3/$2) * 100.0}')
    echo "$memory_usage"
}

# Function to get disk usage percentage
get_disk_usage() {
    # Using df command to get disk usage for root partition
    disk_usage=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')
    echo "$disk_usage"
}

# Function to check if a value is greater than threshold
is_over_threshold() {
    value=$1
    threshold=$2
    # Default to 0 if value is empty
    if [ -z "$value" ]; then
        value=0
    fi
    result=$(awk "BEGIN {print ($value > $threshold)}")
    echo "$result"
}

# Main health check logic
check_vm_health() {
    # Get current resource usage
    cpu=$(get_cpu_usage)
    memory=$(get_memory_usage)
    disk=$(get_disk_usage)
    
    # Threshold is 60%
    threshold=60
    
    # Check if any resource exceeds threshold
    cpu_over=$(is_over_threshold "$cpu" "$threshold")
    memory_over=$(is_over_threshold "$memory" "$threshold")
    disk_over=$(is_over_threshold "$disk" "$threshold")
    
    # Determine health status
    if [ "$cpu_over" -eq 1 ] || [ "$memory_over" -eq 1 ] || [ "$disk_over" -eq 1 ]; then
        health_status="Non-Healthy"
    else
        health_status="Healthy"
    fi
    
    # Check if explain argument is passed
    if [ "$1" = "explain" ]; then
        echo "=== VM Health Status Report ==="
        echo "Health Status: $health_status"
        echo ""
        echo "Resource Utilization:"
        echo "  CPU Usage:    ${cpu}%"
        echo "  Memory Usage: ${memory}%"
        echo "  Disk Usage:   ${disk}%"
        echo ""
        echo "Threshold: ${threshold}%"
        echo ""
        echo "Health Analysis:"
        
        if [ "$cpu_over" -eq 1 ]; then
            echo "  ❌ CPU usage (${cpu}%) exceeds threshold (${threshold}%)"
        else
            echo "  ✅ CPU usage (${cpu}%) is within acceptable range"
        fi
        
        if [ "$memory_over" -eq 1 ]; then
            echo "  ❌ Memory usage (${memory}%) exceeds threshold (${threshold}%)"
        else
            echo "  ✅ Memory usage (${memory}%) is within acceptable range"
        fi
        
        if [ "$disk_over" -eq 1 ]; then
            echo "  ❌ Disk usage (${disk}%) exceeds threshold (${threshold}%)"
        else
            echo "  ✅ Disk usage (${disk}%) is within acceptable range"
        fi
        
        echo ""
        if [ "$health_status" = "Healthy" ]; then
            echo "✅ Overall Status: All resources are operating within normal parameters."
        else
            echo "⚠️  Overall Status: One or more resources exceed the threshold. Action may be required."
        fi
    else
        # Simple output without explanation
        echo "VM Health Status: $health_status"
    fi
}

# Run the health check
check_vm_health "$1"
